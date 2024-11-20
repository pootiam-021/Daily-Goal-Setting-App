
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DailyGoals {
    struct Goal {
        string description;
        bool completed;
    }

    mapping(address => Goal[]) public userGoals;

    function addGoal(string memory description) public {
        userGoals[msg.sender].push(Goal(description, false));
    }

    function markGoalCompleted(uint256 index) public {
        require(index < userGoals[msg.sender].length, "Goal index out of bounds.");
        userGoals[msg.sender][index].completed = true;
    }

    function getGoals() public view returns (Goal[] memory) {
        return userGoals[msg.sender];
    }
}
