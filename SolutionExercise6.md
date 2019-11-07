### First try
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
- how to be sure we don't link three times the same node?
- we need a function to make the recursion

### Second try
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
    	candidate1 = (Inf, Inf)
        candidate2 = (-Inf, -Inf)
        for each m1 in group1
        	if m1 not linked more than one time
	    		for each m2 in group2
    	        	if dist(m1, m2) < dist(candidate1, candidate2)
        	        and m2 not linked more than one time
                        candidate1 = m1
                        candidate2 = m2
        link candidate1 and candidate2
```

Issues:
- how do we sort magnets per x coordinate
- not clever to cut the plane along the same direction each time. Better to alternate, vertical, horizontal
- how to identify whether a magnet has been linked more than one time already?

### Third try

```
function adjacencyMatrix = divideAndConquer(groupOfMagnets of size n, boolValue)
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
        adjMat1 = divideAndConquer(group1, boolValue==false)
        adjMat2 = divideAndconquer(group2, boolValue==false)
    	candidate1 = (Inf, Inf)
        candidate2 = (-Inf, -Inf)
        for each m1 in group1
        	if m1 linked only one time in adjMat1
	    		for each m2 in group2
    	        	if dist(m1, m2) < dist(candidate1, candidate2)
        	        and m2 linked only one time in adjMat2
                        candidate1 = m1
                        candidate2 = m2
        create adjacencyMatrix based on adjMat1 and adjMat2
        link candidate1 and candidate2 in adjacencyMatrix
        return adjacencyMatrix
```

Issues:
- vertical and horizontal cuts are abitrary and may not be optimal

```
... and so on
```
