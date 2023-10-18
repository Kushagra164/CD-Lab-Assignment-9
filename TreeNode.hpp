#include <iostream>

using namespace std;

class TreeNode{
    public:
    TreeNode *left = NULL, *right = NULL;
    double val = 0;
    int type = -1;
    // 1:ADD, 2:SUB, 3:MUL, 4:DIV 
    TreeNode(TreeNode* l, TreeNode* r, double value,  int t){
        type = t;
        left = l;
        right = r;
        val = value;
    }
    TreeNode(double value){
        val = value;
    }
};