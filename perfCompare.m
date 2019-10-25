magnetCenters = [19.7074641741402,7.33471804510408,46.8944579310305,3.86941806146348,17.9516114186594,9.11152141420981;7.76735600558732,27.3774165417136,17.1058406621970,7.57383757442738,23.9934331255429,19.1752332987807]

tic
bruteForcePath = shortestPath(magnetCenters, "Brute Force")
bruteForceTime = toc

tic
nearestNeighborPath = shortestPath(magnetCenters, "Nearest Neighbour")
bruteForceTime = toc

tic
CheapestInsertionPath = shortestPath(magnetCenters, "Cheapest Insertion")
bruteForceTime = toc
