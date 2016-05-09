public void Add(K key,V value)
{
	node=Add(key,value,node);
}

public BinaryNode<K,V> Add(K key,V value,BinaryNode<K,V> tree)
{
	if(tree == null)
		tree=new BinaryNode<K,V>(key,value,NULL,NULL);
	if(key.CompareTo(tree.key)<0)
		tree.left=Add(key,value,tree.left);
	if(key.CompareTo(tree.key)>0)
		tree.left=Add(key,value,tree.right);

       if(key.CompareTo(tree.key)==0)
	       tree.attach.Add(value);
       return tree;
}
public BinaryNode<K> get(BinaryNode<K> tree)
{
	if(tree == NULL)
		return NULL;
	if(tree.left)
		get(tree.left);
	if(tree.right)
		get(tree.right);
	if(tree.left==NULL && tree.right==NULL)
		return tree;
}
