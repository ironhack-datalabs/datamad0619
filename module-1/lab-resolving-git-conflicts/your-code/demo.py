import random
choices=['stone', 'paper', 'scissors', 'lizard', 'spock']
def rand():
  u=random.choice(choices)
  return u

import matplotlib as plt

import matplotlib.image as mpimg




def human():
  resp=str(input("Choose stone, paper, scissors, lizard or spock:"))
  while resp not in choices:
    resp=str(input("Choose stone, paper, scissors, lizard or spock:"))
  return resp

def combat (x,y):
  if str(x)==str(y):
    return 0
  elif str(x)=="stone":
    if str(y)=="scissors":
      return 2
    elif str(y)=="lizard":
      return 2
    else:
      return 1
  elif str(x)=="paper":
    if str(y)=="stone":
      return 2
    elif str(y)=="spock":
      return 2
    else:
      return 1
  elif str(x)=="scissors":
    if str(y)=="paper":
      return 2
    elif str(y)=="lizard":
      return 2
    else:
      return 1
  elif str(x)=="lizard":
    if str(y)=="spock":
      return 2
    elif str(y)=="paper":
      return 2
    else:
      return 1
  else:
    if str(y)=="stone":
      return 2
    elif str(y)=="scissors":
      return 2
    else:
      return 1

def show(x,y):
  print("You chose ",x)
  print("CPU chose ",y)
  if combat(x,y)==0:
    print("Nobody won")
  elif combat(x,y)==1:
    print("CPU wins")
  else:
    print("You win!")

def max():
  max=int(input("Specify the maximum number of games. It has to be odd number of games:"))
  while max%2==0:
    max=int(input("Specify the maximum number of games. It has to be odd number of games:"))
  return max

high=int()
human_wins=int()
CPU_wins=int()
towin=int()



def execute():
  human_wins=int()
  CPU_wins=int()
  high=max()
  towin = int(round(high))
  while human_wins<towin and CPU_wins<towin:
    x=human()
    y=rand()
    show(x,y)
    if combat(x,y)==1:
      CPU_wins+=1
      print("   Human wins ", human_wins, "- CPU wins: ", CPU_wins)
    elif combat(x,y)==2:
      human_wins+=1
      print("   Human wins ", human_wins, "- CPU wins: ", CPU_wins)
    else:
      continue
  if human_wins>CPU_wins:
    print("   YOU WON THE SET!! :)")
  else:
    print("    CPU WON THE SET :(")