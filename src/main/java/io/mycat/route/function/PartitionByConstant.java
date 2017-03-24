package io.mycat.route.function;

import io.mycat.config.model.rule.RuleAlgorithm;

/**
 * 该算法直接返回配置指定的节点下标
 */
public class PartitionByConstant extends AbstractPartitionAlgorithm implements RuleAlgorithm {

    private Integer nodeIndex = 0;

    public void setNodeIndex(Integer nodeIndex) {
        this.nodeIndex = nodeIndex;
    }

    public Integer calculate(String columnValue) {
        return nodeIndex;
    }


    public int getPartitionNum() {
//        return nodeIndexes.length;
        return -1;
    }

}
