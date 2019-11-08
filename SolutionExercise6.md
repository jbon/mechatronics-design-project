# Algorithm #1

```
if n = 1
	do nothing
else if n = 2
	create a link between both magnets
else (n > 2)
	if n even
		separate magnets in two groups of size n/2
	else (number of magnets is odd)
		separate magnets in two groups of size n/2 and n/2+1
	recursion on the group 1
	recursion on the group 2
	insert cheapest link between one element of group 1 and group 2
```
Issues:
- how to separate the magnets into groups?
- we need a function to make the recursion

# Algorithm #2

Improvements :
- we cut along x axis
- we formulated the algorithm as a recursive function

```
function divideAndConquer(groupOfMagnets of size n)
    if n = 1
        do nothing
    else if n = 2
        create a link between both magnets
    else (n > 2)
    	sort magnets per x coordinate
        if n even
            group1 = groupOfMagnets(1:n/2)
            group2 = groupOfMagnets(n/2+1:n)
        else (number of magnets is odd)
            group1 = groupOfMagnets(1:floor(n/2)
            group2 = groupOfMagnets(ceil(n/2):n)
        divideAndConquer(group1)
        divideAndconquer(group2)
		insert cheapest link between one element of group 1 and group 2

```

Issues:
- how do we sort magnets per x coordinate
- not clever to cut the plane along the same direction each time. Better to alternate, vertical, horizontal
- we need to close the loop at the end

# Algorithm #3

Improvements :
- we alternatively cut along x and y axes 
- we use the sort() function to sort along x and y axes
- we make sure to close the loop at the end

```
function divideAndConquer(groupOfMagnets of size n, boolValue)
    if n = 1
        do nothing
    else if n = 2
        create a link between both magnets
    else (n > 2)
    	sort(magnets, dimension=boolValue)
        if n even
            group1 = groupOfMagnets(1:n/2)
            group2 = groupOfMagnets(n/2+1:n)
        else (number of magnets is odd)
            group1 = groupOfMagnets(1:floor(n/2)
            group2 = groupOfMagnets(ceil(n/2):n)
        divideAndConquer(group1, boolValue==false)
        divideAndconquer(group2, boolValue==false)
		insert cheapest link between one element of group 1 and group 2
endfunc
close the loop
```
Issues:
- vertical and horizontal cuts are abitrary and may not be optimal
- how to identify whether a magnet has been linked more than one time already?
- how to identify the two nodes that need to be linked so we can close the loop?
- why not closing the loop at each stage instead only at the end?

# Algorithm #4

Improvements:
- Instead of cutting alternatively along x or y, we "can find in which of the two dimensions the points have a larger spread, and then find the median point along that dimension." (solution from Guy Blelloch, Carnegie Mellon University, School of Computer Science, from his lecture "[Parallel and Sequential Data Structures and Algorithms](http://www.cs.cmu.edu/afs/cs/academic/class/15210-f12/www/lectures/lecture04.pdf)")
- we use the adjacencyMatrix to identify which magnets have already been linked two times
- we use the adjacencyMatrix to identify both magnets to link to close the loop
- instead of creating open paths, we create closed paths from the begining on, and we reopen them to merge paths

```
function adjacencyMatrix = divideAndConquer(groupOfMagnets of size n)
    if n = 1
        do nothing
    else if n = 2
        create a link between both magnets
    else if n = 3 
    	close the triad
    else (n > 3)
    	sort(magnets, dimension x)
        determine spreadX
        sort(magnets, dimension y)
        determine spreadY
        if spreadX > spreadY
        	cutDimension = x
        else
        	cutDimension = y
        if n even
            group1 = groupOfMagnets(1:n/2)
            group2 = groupOfMagnets(n/2+1:n)
        else (number of magnets is odd)
            group1 = groupOfMagnets(1:floor(n/2)
            group2 = groupOfMagnets(ceil(n/2):n)
        adjMat1 = divideAndConquer(group1)
        adjMat2 = divideAndconquer(group2)
    	based on adjMat1 and adjMat2
        	merge both subgraphs by replacing links and create a closed graph
        return adjacencyMatrix
endfunc
lineEnds = []
for m1 in groupOfMagnets
	if linked only one time in adjacencyMatrix
    	add m1 in lineEnds
link both elements in lineEnds
```

Issues:
- how to find the best links to replace?