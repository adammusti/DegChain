// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Acounts {
        
    struct ExamCells {
        string candidate_name;
        string Dept_name;
        string Class_of_degree;
        uint256 Roll_numb;
        uint256 Total_CGPA;
    }
    mapping(bytes32 => ExamCells) public certificates;

    event examCel(bytes32 _certificateId);

    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        assembly {
                result := mload(add(source, 32))
        }
    }

    function Approva_candidate(
        string memory _id,
        string memory _candidate_name,
        string memory Dept_name, 
        string memory _Class_of_degree,
        uint256 Roll_numb, 
        uint256 Total_CGPA) 
        public { bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].Total_CGPA == 0, "ExamCells with given id already exists");

        certificates[byte_id] = ExamCells(_candidate_name, Dept_name, _Class_of_degree, Roll_numb, Total_CGPA);
        emit examCel(byte_id);
    }

    function getData(string memory _id) public view returns(string memory, string memory, string memory, uint256, uint256) {
        bytes32 byte_id = stringToBytes32(_id);
        ExamCells memory temp = certificates[byte_id];
        require(temp.Total_CGPA != 0, "No data exists");
        return (temp.candidate_name, temp.Dept_name, temp.Class_of_degree, temp.Roll_numb, temp.Total_CGPA);
    }
}
