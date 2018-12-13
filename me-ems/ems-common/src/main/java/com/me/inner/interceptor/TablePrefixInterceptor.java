package com.me.inner.interceptor;


import com.me.inner.dialect.DBDialect;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.scripting.xmltags.DynamicContext;
import org.apache.ibatis.scripting.xmltags.DynamicSqlSource;
import org.apache.ibatis.scripting.xmltags.SqlNode;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Intercepts({
        @Signature(type = Executor.class, method = "update", args = { MappedStatement.class, Object.class }),
        @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class,RowBounds.class, ResultHandler.class }) })
public class TablePrefixInterceptor implements Interceptor {

    private static final Logger logger = LoggerFactory.getLogger(TablePrefixInterceptor.class);

    private String systemTablePrefix;
    private DBDialect dialect;
    private final String TABLEPREFIXKEY = "tablePrefix";
    private final String DIALECTKEY = "dialect";

    public Object intercept(Invocation invocation) throws Throwable {
        Object[] args = invocation.getArgs();

        MappedStatement mappedStatement = (MappedStatement) args[0];

        SqlSource sqlSource = mappedStatement.getSqlSource();

        if (sqlSource instanceof DynamicSqlSource) {
            Field rootSqlNodeField = DynamicSqlSource.class.getDeclaredField("rootSqlNode");
            rootSqlNodeField.setAccessible(true);
            SqlNode sqlnode = (SqlNode) rootSqlNodeField.get(sqlSource);
            SqlNode oriSqlNode = sqlnode;
            if (sqlnode instanceof SqlNodeProxy) {
                oriSqlNode = ((SqlNodeProxy) sqlnode).target;
            }

            Map<String, Object> paramMap = new HashMap<String, Object>();

            paramMap.put(TABLEPREFIXKEY, systemTablePrefix);
            paramMap.put(DIALECTKEY, this.dialect.toString());

            rootSqlNodeField.set(sqlSource, new SqlNodeProxy(sqlnode, paramMap));
        }

        return invocation.proceed();
    }

    private SqlNode proxyTablePrefix(SqlNode sqlnode, Object value) {
        return new SqlNodeProxy(sqlnode, TABLEPREFIXKEY, value);
    }

    private SqlNode proxyDialect(SqlNode sqlnode, Object value) {
        return new SqlNodeProxy(sqlnode, DIALECTKEY, value);
    }

    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    public void setProperties(Properties properties) {
    }

    public String getSystemTablePrefix() {
        return this.systemTablePrefix;
    }

    public void setSystemTablePrefix(String systemTablePrefix) {
        this.systemTablePrefix = systemTablePrefix;
    }

    public DBDialect getDialect() {
        return dialect;
    }

    public void setDialect(DBDialect dialect) {
        this.dialect = dialect;
    }


    private class SqlNodeProxy implements SqlNode {
        private SqlNode target;
        private Map<String, Object> map = new HashMap<String, Object>();

        SqlNodeProxy(SqlNode target, String param, Object value) {
            super();
            this.target = target;
            map.put(param, value);
        }

        SqlNodeProxy(SqlNode target, Map<String, Object> map) {
            super();
            this.target = target;
            this.map = map;
        }

        public boolean apply(DynamicContext context) {
            context.getBindings().putAll(map);
            return target.apply(context);
        }
    }

}