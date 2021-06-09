import numpy as np
import math
import os
h = open("history.txt", "r")
line = h.readline()
first_line_split = line.split(" ")
the_dict = {}
seen = {}
for i in range(1, int(first_line_split[1])+1):
    seen.update({i : []})
for i in range(1, int(first_line_split[1])+1):
    the_dict.update({i : []})
line_split = line.split(" ")
sort_by = line_split[1].rstrip('\n')
sort_by = int(sort_by)
for line in sorted(line, key=lambda line: sort_by):
    for i in range(1, int(first_line_split[0])+1):
        for line in h:
            line_split = line.split(" ")
            
            if int(line_split[0].rstrip('\n')) not in seen[int(line_split[1].rstrip('\n'))]:
                seen[int(line_split[1].rstrip('\n'))].extend([int(line_split[0])])

for key, value in seen.items():
    seen[key].sort()

list1 = list(range(1, int(first_line_split[0].strip('\n'))+1))
for i in range(1, int(first_line_split[1].strip('\n'))+1):
    n = 0
    for x in list1:
        try:
            if x == seen[i][n]:
                n=n+1
                the_dict[i].extend([1])
            else:
                the_dict[i].extend([0])
        
        except IndexError:
            the_dict[i].extend([0])

def calc_angle(x, y):
    norm_x = np.linalg.norm(x)
    norm_y = np.linalg.norm(y)
    cos_theta = np.dot(x, y) / (norm_x * norm_y)
    theta = math.degrees(math.acos(cos_theta))
    return(theta)

def similar():
    positive = 0
    for key,values in seen.items():
        positive = positive + len(values)
    similarity = {}
    a=1
    b=int(first_line_split[1].rstrip('\n'))+1
    c=b-1
    d=1
    theta_sum = 0
    while a<b:
        n = 1
        for i in range(d, c):
            name = (str(d)+str(b-n))
            theta = calc_angle(the_dict[d], the_dict[b-n])
            theta = round(theta, 2)
            n=n+1
            similarity.update({(int(name)) : theta})
            theta_sum = theta_sum + theta
        d=d+1
        a=a+1
    average = round((theta_sum/positive), 2)
    return similarity, positive, average

h = open("queries.txt", "r")
similarity, positive, average = similar()
print("Positive entries:", positive)
print("Average angle:", average)
for line in h:
    matched = {}
    recommend_dict = {}
    list1 = {}
    list2 = []
    print("Shopping cart:", line, end='')
    line_split = line.split(" ")
    for item in line_split:
        for i in range (1, int(first_line_split[1].rstrip('\n'))+1):
            check_1 = (str(item.rstrip('\n')) + str(i))
            check_2 = (str(i) + str(item.rstrip('\n')))
            for key, value in similarity.items():
                if (int(key) == int(check_1)) or (int(key) == int(check_2)):
                    if int(value) < 90:
                        if (str(i) not in (line_split)) and (str(i) not in (line_split[len(line_split)-1].rstrip('\n'))):  
                            matched.update({(float(value)) : ((int(key)), int(i))})
        try:
            match = min(matched)
            list1.update({str(match): matched[match][1]}) 
            list2.append(str(match))
            list2.sort()
            print("Item:", item.rstrip('\n')+"; match:", str(matched[match][1])+"; angle:", match)
            matched = {}
        except ValueError:
            print("Item:", item.rstrip('\n')+" no match")
    for i in list2:
        try:
            recommend = recommend
            if str(list1[str(i)]) not in recommend:
                recommend = (str(recommend) + ' ' + str(list1[i]))
        except NameError:
            recommend = str(list1[str(i)])
    matched = {}
    match = 0
    try:
        
        print("Recommend:", recommend)
        del recommend
    except NameError:
        print("Recommend:")
        pass
