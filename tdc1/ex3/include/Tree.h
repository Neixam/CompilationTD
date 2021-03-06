#ifndef __TREE_H_
#define __TREE_H_

typedef struct  s_tree
{
    int     num;
    char    op;
    struct s_tree   *bro;
    struct s_tree   *son;
}               t_node,
                *t_tree;

t_tree  make_node(int num, char op);

int     add_sibling(t_tree *t, t_tree bro);

int     add_child(t_tree *t, t_tree child);

int     is_node(t_tree t);

void    print_tree(t_tree t, int indent);

void    free_tree(t_tree *t);

#endif
