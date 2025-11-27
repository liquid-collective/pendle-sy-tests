// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.28;

import {SYTest} from "../common/SYTest.t.sol";
import {PendleLsETHSY} from "../../src/PendleLsETHSY.sol";
import {IStandardizedYield} from "pendle-sy/interfaces/IStandardizedYield.sol";

contract PendleLsETHSYTest is SYTest {
    function setUpFork() internal override {
        vm.createSelectFork("ethereum");
    }

    function deploySY() internal override {
        vm.startPrank(deployer);

        sy = IStandardizedYield(
            deployTransparentProxy(
                address(new PendleLsETHSY()),
                deployer,
                abi.encodeWithSelector(PendleLsETHSY.initialize.selector, deployer)
            )
        );

        vm.stopPrank();
    }
}
