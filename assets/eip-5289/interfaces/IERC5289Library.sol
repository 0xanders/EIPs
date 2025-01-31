/// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "./IERC165.sol";

interface IERC5289Library is IERC165 {
    /// @notice Emitted when signDocument is called
    event DocumentSigned(address indexed signer, uint16 indexed documentId);
    
    /// @notice The IPFS multihash of the legal document. This MUST use a common file format, such as PDF, HTML, TeX, or Markdown.
    function legalDocument(uint16 documentId) public pure returns (bytes memory);
    
    /// @notice Returns whether or not the given user signed the document.
    function documentSigned(address user, uint16 documentId) public view returns (boolean signed);

    /// @notice Returns when the the given user signed the document.
    /// @dev If the user has not signed the document, the timestamp may be anything.
    function documentSignedAt(address user, uint16 documentId) public view returns (uint64 timestamp);

    /// @notice Provide a signature
    /// @dev This MUST be validated by the smart contract. This MUST emit DocumentSigned or throw.
    function signDocument(address signer, uint16 documentId, bytes memory signature) public;
}
