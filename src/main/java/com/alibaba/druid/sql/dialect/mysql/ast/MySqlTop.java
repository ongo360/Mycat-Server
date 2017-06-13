/*
 * Copyright 1999-2101 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.alibaba.druid.sql.dialect.mysql.ast;

import com.alibaba.druid.sql.ast.SQLExpr;
import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlASTVisitor;
import com.alibaba.druid.sql.dialect.mysql.visitor.MySqlOutputVisitor;
import com.alibaba.druid.sql.visitor.SQLASTVisitor;

public class MySqlTop extends MySqlObjectImpl {

    private SQLExpr expr;
    private boolean percent;
    private boolean withTies;

    public MySqlTop(){

    }

    public MySqlTop(SQLExpr expr){
        this.setExpr(expr);
    }

    public SQLExpr getExpr() {
        return expr;
    }

    public void setExpr(SQLExpr expr) {
        if (expr != null) {
            expr.setParent(this);
        }
        this.expr = expr;
    }

    public boolean isPercent() {
        return percent;
    }

    public void setPercent(boolean percent) {
        this.percent = percent;
    }

    public boolean isWithTies() {
        return withTies;
    }

    public void setWithTies(boolean withTies) {
        this.withTies = withTies;
    }

    @Override
    protected void accept0(SQLASTVisitor visitor) {
        if (visitor instanceof MySqlOutputVisitor) {
            accept0((MySqlOutputVisitor) visitor);
        }
    }

    @Override
    public final void accept0(MySqlASTVisitor visitor) {

    }

    public void accept0(MySqlOutputVisitor visitor) {
        visitor.visit(this);
        visitor.endVisit(this);
    }

}
