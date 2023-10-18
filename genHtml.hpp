#include <fstream>
#include <string>

using namespace std;

void addName(string &output, TreeNode* root){
    output += "[";
    switch (root->type)
    {
    case 1:
        output += "\"+\"";
    break;
    case 2:
        output += "\"-\"";
    break;
    case 3: 
        output += "\"*\"";
    break;
    case 4:
        output += "\"/\"";
    break;
    default:
        output += to_string(root->val);
    break;
    }
    output += "]";
    return;
}

void DFS(TreeNode* root, string &output){
    if(root->left){
        DFS(root->left, output);
        output += "\t\t\t"+ to_string((long long)root);
        addName(output, root);
        output += " --> ";
        output +=  to_string((long long)root->left);
        addName(output, root->left);
        output += "\n";
    }
    if(root->right){
        DFS(root->right, output);
        output += "\t\t\t"+ to_string((long long)root);
        addName(output, root);
        output += " --> ";
        output +=  to_string((long long)root->right);
        addName(output, root->right);
        output += "\n";
    }
    return;
}

void generateOutputHtml (TreeNode *root){
    //Generating ouptut:

    string output = R"(
    <html>
        <head>
            <title>Abstract Syntax Tree</title>
        </head>
        <body>
            <div class="mermaid">
            graph TD)";

    output += "\n";

    DFS(root, output);

    output += R"(
            </div>
            <script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
            <script>
                mermaid.initialize({ startOnLoad: true });
            </script>
        </body>
    </html>
    )";

    //Writing output to file:
    ofstream OUTFILE;
    OUTFILE.open("output.html");
    OUTFILE << output;
    OUTFILE.close();

    return;
}