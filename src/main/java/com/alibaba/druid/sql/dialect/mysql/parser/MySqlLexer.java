package com.alibaba.druid.sql.dialect.mysql.parser;

import com.alibaba.druid.sql.parser.Keywords;
import com.alibaba.druid.sql.parser.Token;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by jackychenb on 13/06/2017.
 */
public class MySqlLexer extends MySqlLexerStub
{
    public final static Keywords DEFAULT_MYCAT_KEYWORDS;

    static
    {
        Map<String, Token> map = new HashMap<String, Token>();

        map.putAll(Keywords.DEFAULT_KEYWORDS.getKeywords());

        map.put("DUAL", Token.DUAL);
        map.put("FALSE", Token.FALSE);
        map.put("IDENTIFIED", Token.IDENTIFIED);
        map.put("IF", Token.IF);
        map.put("KILL", Token.KILL);

        map.put("LIMIT", Token.LIMIT);
        map.put("TRUE", Token.TRUE);
        map.put("BINARY", Token.BINARY);
        map.put("SHOW", Token.SHOW);
        map.put("CACHE", Token.CACHE);
        map.put("ANALYZE", Token.ANALYZE);
        map.put("OPTIMIZE", Token.OPTIMIZE);
        map.put("ROW", Token.ROW);
        map.put("BEGIN", Token.BEGIN);
        map.put("END", Token.END);

        map.put("TOP", Token.TOP);

        DEFAULT_MYCAT_KEYWORDS = new Keywords(map);
    }

    public MySqlLexer(char[] input, int inputLength, boolean skipComment)
    {
        super(input, inputLength, skipComment);
        super.keywods = DEFAULT_MYCAT_KEYWORDS;
    }

    public MySqlLexer(String input)
    {
        super(input);
        super.keywods = DEFAULT_MYCAT_KEYWORDS;
    }

}
