num = int(input())                                                   
ans = [0]*num                                                        
                                                                     
def init_word_list():                                                
    with open("words.txt") as f:                                     
        word_list = f.readlines()                                    
                                                                     
    for i,v in enumerate(word_list):                                 
        word_list[i] = v.strip()                                     
                                                                     
    return word_list                                                 
                                                                     
def letter_count(word):                                              
    count = {}                                                       
    for i in range(len(word)):                                       
        try:                                                         
            count.update({word[i]:count[word[i]]+1})                 
        except KeyError:                                             
            count.update({word[i]:1})                                
    return count                                                     
                                                                     
def size_sieve(n, word_list):                                        
    new_word_list = []                                               
    for i in range(len(word_list)):                                  
        if (len(word_list[i]) == n):                                 
            new_word_list.append(word_list[i])                       
    return new_word_list                                             
                                                                     
word_list = init_word_list()                                         
                                                                     
for n in range(num):                                                 
    word = input()                                                   
    mod_word_list = size_sieve(len(word), word_list)                 
    for can in mod_word_list:                                        
        if (letter_count(word) == letter_count(can) and word != can):
            ans[n] += 1                                              
                                                                     
print(' '.join(list(map(str, ans))))   
