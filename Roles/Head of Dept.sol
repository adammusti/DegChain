// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract HOD { 
    struct checksAcc {
        string candidate_name;
        string Faculty_name;
        string course_name;
        uint256 graduation_date;
    }
    mapping(bytes32 => checksAcc) public certificates;

    event checksacct(bytes32 _certificateId);

    function stringToBytes32(string memory source) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
        else if
            (tempEmptyStringTest.length != 0){
            return 0;
        }

        assembly {
                result := mload(add(source, 32))
        }
    }

    function checkesAcct (
        string memory _id,
        string memory Candidate_name,
        string memory Faculty_name, 
        string memory Dept_name, 
        uint256 Date_of_graduation) public {
        bytes32 byte_id = stringToBytes32(_id);
        require(certificates[byte_id].graduation_date == 0, "checksAcc with given id already exists");

        certificates[byte_id] = checksAcc(Candidate_name, Faculty_name, Dept_name, Date_of_graduation);
        emit checksacct(byte_id);
    }

    function getData(string memory _id) public view returns(string memory, string memory, string memory, uint256) {
        bytes32 byte_id = stringToBytes32(_id);
        checksAcc memory temp = certificates[byte_id];
        require(temp.graduation_date != 0, "No data exists");
        return (temp.candidate_name, temp.Faculty_name, temp.course_name, temp.graduation_date);
    }
}
