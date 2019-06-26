files = [[6, 'of'], [8, 'spent'], [12, '20'], [7, 'time'], [21, 'need'], [22, 'to'], [5, 'percent'], [18, 'complaining'], [16, 'is'], [24, 'data.'], [10, 'preparing'], [14, 'of'], [11, 'data,'], [23, 'prepare'], [20, 'the'], [3, 'science,'], [4, '80'], [19, 'about'], [17, 'spent'], [2, 'data'], [13, 'percent'], [15, 'time'], [9, 'is'], [1, 'In']]


files.sort()

phrase = [e[1] for e in files]

print(" ".join(phrase))