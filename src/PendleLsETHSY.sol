/// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;

import "../lib/pendle-sy/contracts/core/StandardizedYield/implementations/PendleERC20SYUpgV2.sol";
import "./interfaces/ILsETH.sol";

contract PendleLsETHSY is PendleERC20SYUpgV2 {
    address public constant LSETH = 0x8c1BEd5b9a0928467c9B1341Da1D7BD5e10b6549; // Liquid Collective LsETH on Ethereum mainnet

    constructor() PendleERC20SYUpgV2(LSETH) {}

    function initialize(address _owner) external initializer {
        __SYBaseUpgV2_init("SY Liquid Staked ETH", "SY-LsETH", _owner);
    }

    /*///////////////////////////////////////////////////////////////
                               EXCHANGE-RATE
    //////////////////////////////////////////////////////////////*/

    /// @notice Returns the ETH-per-LsETH exchange rate
    /// @dev This is monotonic (never decreases) as staking rewards accrue
    /// @return The amount of ETH (1e18 scaled) that 1 LsETH is worth
    function exchangeRate() public view override returns (uint256) {
        return ILsETH(LSETH).underlyingBalanceFromShares(1e18);
    }

    /*///////////////////////////////////////////////////////////////
                MISC FUNCTIONS FOR METADATA
    //////////////////////////////////////////////////////////////*/

    function assetInfo()
        external
        view
        override
        returns (AssetType assetType, address assetAddress, uint8 assetDecimals)
    {
        return (AssetType.TOKEN, NATIVE, 18);
    }
}
