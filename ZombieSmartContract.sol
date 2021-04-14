pragma solidity >= 0.5.0 <= 0.6.0;


contract ZombieFactory{
  event NewZombie(uint zombieId, string name, uint dna);
  uint dnadigits = 16;
  uint dnaModulus = 10 ** dnadigits;
  
  struct Zombie{
  string name;
  uint dna;
  }
  Zombie[] public zombies;
  function CreateNewZombie(string memory _name, uint dna) private{
    uint id = zombies.push(Zombie(_name, dna)) - 1;
    emit NewZombie(id, _name, dna);
    }
    
   function _generaterandomDna(string memory _name) private view returns(uint){
      uint rand = uint(keccak256(abi.encodePacked(_name));
      return rand % dnaModulus;
      }
      
   function createRandomZombies(string memory _name) public{
      uint randDna = generaterandomDna(_name);
      CreateNewZombie(_name, randDna);
      }
      
      
   //==-------------------------------------------
   
