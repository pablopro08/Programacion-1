A = [23,54,76,1,12]
B = [33,22,98,54,12]
newlist = []
for a_1 in A:
    for b_1 in B:
        if a_1==b_1:
            newlist.append(a_1)

print(newlist)