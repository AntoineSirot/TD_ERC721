# TD_ERC721

## Introduction

Welcome! This is my work on an automatic workshop. This repository contain my answer but you can also work on this project by going to this repo : https://github.com/AymericNoel/erc721-101 on the fix branch. In this project I implemented several functions in a new ERC271 smart contract to interact with the Evaluator's contracts (which sepolia address are : 0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0 and 0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab). I will explain the logic i used in every step of this projet. 

## How could you run my solution ? 

To do so you just have to clone my repo and implement you private key and your infura key in the truffle-config.js file. WARNING don't forget that you should never share your private key especially in a GitHub repository !!

## How did I work on this TD
### Warning

Before I start to explain how I proceed to work I should warn you that my solution isn't optimized at all. I did the maximum I could in the time I had so for example you can't complete every exercices with my current contract. I changed it several times to validate exercices.

### Exercice 1 :

This first Exercice will only check that your basic ERC721 functions work.

### Exercice 2 :

This second Exercice has two parts. First I got assigned some caracteristics for an animal composed by his legs, sex, name and wings. In the second part I've had to mint this precise animal for the Evaluator's contract.

### Exercice 3 :

The third Exercice let us implement functions to force any customer to pay a certain price before he could be a bredder and have animals.

### Exercice 4 :

In this Exercice I had to mint an animal for the Evalutor's contract only after he became a bredder (which he becaming by paying).

### Exercice 5 :

He we declared a dead animal where the owner should loose his animal and every caracteristics of he dead animal should be reinitialised.

### Exercice 6:

This is the begging of the exchange par. In this Exercice I implemented functions to put an animal for selling at a certain price. After that I allowed customers to buy animal on sale.

### Exercice 7a :

This is the last exercice I did and here I set parents to a current animal.

### Exercice 7b & 7c :

As I said before I didn't implement this exercice but I will in the next weeks where I will have time to..

## Conclusion

This TD had a perfect complexity after doing the ERC-20 one. I learned a lot doing it don't hesitate to try it to ! 
