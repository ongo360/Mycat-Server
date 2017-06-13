package com.alibaba.druid.sql.dialect.mysql.parser;

import com.alibaba.druid.sql.dialect.mysql.ast.MySqlTop;
import com.alibaba.druid.sql.parser.Lexer;
import com.alibaba.druid.sql.parser.Token;

/**
 * Created by jackychenb on 13/06/2017.
 */
public class MySqlExprParser extends MySqlExprParserStub {

    public static final String[] max_agg_functions = {"AVG", "COUNT", "GROUP_CONCAT", "MAX", "MIN", "STDDEV", "SUM", "ROW_NUMBER"};

    public MySqlExprParser(Lexer lexer)
    {
        super(lexer);
        super.aggregateFunctions = max_agg_functions;
    }

    public MySqlExprParser(String sql)
    {
        super(new MySqlLexer(sql));
        lexer.nextToken();
        super.aggregateFunctions = max_agg_functions;
    }

    public MySqlTop parseTop() {
        if (lexer.token() == Token.TOP) {
            MySqlTop top = new MySqlTop();
            lexer.nextToken();

            boolean paren = false;
            if (lexer.token() == Token.LPAREN) {
                paren = true;
                lexer.nextToken();
            }

            top.setExpr(primary());

            if (paren) {
                accept(Token.RPAREN);
            }

            if (lexer.token() == Token.PERCENT) {
                lexer.nextToken();
                top.setPercent(true);
            }

            return top;
        }

        return null;
    }

}
