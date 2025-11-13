// SPDX-License-Identifier: GPL-3.0-or-later

interface ILsETH {
    /// @notice Returns the underlying balance of the ETH token for a given number of shares
    /// @param shares The number of shares to convert to underlying balance
    /// @return The underlying balance of the ETH token
    function underlyingBalanceFromShares(uint256 shares) external view returns (uint256);
}
