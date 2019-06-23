import re
def normal_species(str):
    y= str.lower()
    if 'whitetip' in y or  'oceanic' in y:
        return 'Oceanic Whitetip Shark'
    elif 'sand' in y or 'tooth' in y or re.search('gr\wy nurs',y) or re.search('bl\w+[- ]nu\w+',y):
        return 'Sand Tiger Shark'
    elif 'bull' in y or 'zamb' in y or 'horn' in y:
        return 'Bull Shark'
    elif 'blue' in y or re.search('tinto\w+',y):
        return 'Blue Shark'
    elif 'mako' in y or 'bonita' in y:
        return 'Shortfin Mako Shark'
    elif 'lemon' in y:
        return 'Lemon Shark'
    if re.search('gr\wy',y):
            return 'Gray Reef Shark'
    elif 'reef' in y:
        if re.search('black\w*',y):
            return 'Blacktip Reef Shark'
    elif 'nurse' in y :
        return 'Nurse Shark'
    elif re.search('hammer\w*',y):
        return 'Great Hammerhead Shark' 
    elif re.search('black\w*',y):
        return 'Blacktip Shark'
    elif 'white' in y:
        return 'White Shark'
    elif 'tiger' in y:
        return 'Tiger Shark'
    elif 'wobbegong' in y:
        return 'Wobbegong Shark'
    elif 'wobbegong' in y:
        return 'Wobbegong Shark'
    elif 'bronze' in y or 'whaler' in y or 'copper' in y:
        return 'Bronze Whaler Shark'
    elif 'carpet' in y :
        return 'Carpet Shark'
    elif 'dog' in y or re.search('bask\w+', y):
        return 'Dogfish Shark'
    elif 'spinner' in y :
        return 'Spinner Shark'
    elif 'brown' in y or 'sandbar' in y:
        return 'Sandbar Shark'
    elif 'dusky' in y:
        return 'Dusky Shark'
    elif 'involvement' in y:
        return 'Shark involvement not confirmed'
    elif 'unidentified' in y or 'authenticated' in y or re.search('unkno\w+', y):
        return 'Unknown'
    elif re.search("galapa\w+",y):
        return 'Galapagos Shark'
    elif re.search('whale', y):
        return 'Whale Shark'
    elif re.search('broadn\w+', y) or re.search('gill', y):
        return 'Broadnose Sevengill Shark'
    elif re.search('schoo\w+', y) or re.search('soup\w+', y) or re.search('tope', y):
        return 'School Shark'
    #elif re.search('ang\w+', y) or re.search('guit\w+', y):
     #   return 'Angel Shark'
    elif re.search("cook\w*",y) or re.search("cutt\w*",y):
        return 'Cookie Cutter Sark'
    elif re.search("\d'",y) or re.search("\d*.m",y) or re.search("small",y) or re.search("kg",y):
        return 'Other'
    else: return 'Other'
    
print(normal_species("Shark in msadfasfj white oceanic"))