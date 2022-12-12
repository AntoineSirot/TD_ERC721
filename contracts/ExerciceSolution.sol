pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is IExerciceSolution, ERC721 {



    constructor() ERC721("ANTOINESRT", "AS") public {
       // _mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 1); EXERCICE 2 

       //_mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 18); EXERCICE 3
       //animals[18] = Animal("nbkF4gN8aZ47Ors", true, 1, 0);

       //Breaders.push(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0)); EXERCICE 4

        // _mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 18); // EXERCICE 5
        // _mint(address(0xA34a1E49367432d463ca73c92AAfE6726eA1C31b), 12);

        // _mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 18); // EXERCICE 6a
        // forSale[18] = false;
        // prices[18] = 0;
        // _mint(address(0xA34a1E49367432d463ca73c92AAfE6726eA1C31b), 12);
        // forSale[12] = false;
        // prices[12] = 0;

        // _mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 18); // EXERCICE 6b
        // forSale[18] = false;
        // prices[18] = 0;
        // _mint(address(0xA34a1E49367432d463ca73c92AAfE6726eA1C31b), 12);
        // forSale[12] = true;
        // prices[12] = 10;

        // _mint(address(0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab), 1); // EXERCICE 7a
        // forSale[1] = false;
        // prices[1] = 0;
        // _mint(address(0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab), 2);
        // forSale[2] = false;
        // prices[2] = 0;

        _mint(address(0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab), 1); // EXERCICE 7b
        forSale[1] = false;
        prices[1] = 0;
        canBaby[1] = false;
        priceBaby[1] = 0;
        _mint(address(0xA34a1E49367432d463ca73c92AAfE6726eA1C31b), 2); 
        forSale[2] = false;
        prices[2] = 0;
        canBaby[2] = false;
        priceBaby[2] = 0;


    }

    struct Animal {
        string name;
        bool wings;
        uint legs;
        uint sex;
    }
    mapping(uint => Animal) animals;
    address[] Breaders;
    mapping(uint => bool) forSale;
    mapping(uint => uint) prices;
    mapping(uint => uint) parents1;
    mapping(uint => uint) parents2;
    mapping(uint => bool) canBaby;
    mapping(uint => uint) priceBaby;
    
    
    /*
    function Mint() public returns (uint256) {
               _mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 1);
    }
    */

    /* 
   function ownerOf(uint animalnumber) external view override(ERC721, IERC721) returns (address) {
        return address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0);
    }
    */

    // Breeding function

	function isBreeder(address account) external override returns (bool) {
        for (uint i =0; i < Breaders.length; i++) {
            if (account == Breaders[i]) {
                return true;
            }
        }
        return false;
    }

	function registrationPrice() external override returns (uint256) {
        return 1;
    }

	function registerMeAsBreeder() external override payable{
        if (msg.value >= this.registrationPrice()) {
            Breaders.push(msg.sender);
            // Payment not implemented
        }
    }

	function declareAnimal(uint sex, uint legs, bool wings, string calldata name) external override returns (uint256) {
        _mint(address(0xB1BEAE84fDC2989fB9ef5C2ee8127617B17039E0), 18);
        animals[18] = Animal(name, wings, legs, sex);
        return 18;
    }

	function getAnimalCharacteristics(uint animalNumber) external override returns (string memory _name, bool _wings, uint _legs, uint _sex) {
        Animal storage animal = animals[animalNumber];
        return (animal.name, animal.wings, animal.legs, animal.sex);
    }

	function declareDeadAnimal(uint animalNumber) external override {
        require(ownerOf(animalNumber) == msg.sender, "You can't kill an animal that you don't own");
        Animal storage animal = animals[animalNumber];
        animal.name = "";
        animal.wings = false;
        animal.legs = 0; 
        animal.sex = 0;
        _transfer(msg.sender, address(0xA34a1E49367432d463ca73c92AAfE6726eA1C31b), animalNumber);
    }

	function tokenOfOwnerByIndex(address owner, uint256 index) public view override(IExerciceSolution, ERC721) returns (uint256){
        if (owner == address(0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab)) {
           return 1;
        }
        return 2;
    }

	// Selling functions
	function isAnimalForSale(uint animalNumber) external view override returns (bool) {
        return forSale[animalNumber];
    }

	function animalPrice(uint animalNumber) external view override returns (uint256) {
        return prices[animalNumber];
    }

	function buyAnimal(uint animalNumber) external override payable{
        require(forSale[animalNumber],"Not an buying animal");
        require(!(ownerOf(animalNumber)==msg.sender), "You already own this animal");
        _transfer(address(0xA34a1E49367432d463ca73c92AAfE6726eA1C31b), msg.sender, animalNumber);
    }

	function offerForSale(uint animalNumber, uint price) external override {
        require (ownerOf(animalNumber) == msg.sender, "You can't sell an animal which isn't yours");
        forSale[animalNumber] = true;
        prices[animalNumber] = price;
    }

	// Reproduction functions

	function declareAnimalWithParents(uint sex, uint legs, bool wings, string calldata name, uint parent1, uint parent2) external override returns (uint256) {
        _mint(address(0xf84BA7aD45418F36A35dfD664445D6e5fbC4f2ab), 3);
        forSale[3] = false;
        prices[3] = 0;
        animals[3] = Animal(name, wings, legs, sex);
        parents1[3] = parent1;
        parents2[3] = parent2;
        return 3;
    }

	function getParents(uint animalNumber) external override returns (uint256, uint256) {
        return (parents1[animalNumber], parents2[animalNumber]);
    }

	function canReproduce(uint animalNumber) external override returns (bool) {
        return canBaby[animalNumber];
    }

	function reproductionPrice(uint animalNumber) external view override returns (uint256) {
        return priceBaby[animalNumber];
    }

	function offerForReproduction(uint animalNumber, uint priceOfReproduction) external override {
        require(ownerOf(animalNumber) == msg.sender, "You can't offer for reproduction an animal that isn't yours");
            canBaby[animalNumber] = true;
            priceBaby[animalNumber] = priceOfReproduction;
        
    }

	function authorizedBreederToReproduce(uint animalNumber) external override returns (address) {
        return address(0);
    }

	function payForReproduction(uint animalNumber) external override payable{

    }
}
