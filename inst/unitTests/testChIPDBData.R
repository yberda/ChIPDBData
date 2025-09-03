# Load the required package
library(RUnit)
library(ChIPDBData)

test_getChIPDB <- function() {
    # Test DB loading
    ChIPDB <- getChIPDB("ENCODE_rE2G_300depth")
    RUnit::checkEquals(length(ChIPDB), 2)
    
    # Test first element is a vector
    RUnit::checkTrue(is.vector(ChIPDB[[1]]))

    # Test second element is a list
    RUnit::checkTrue(is.list(ChIPDB[[2]]))

    # Test with edge case: wrong dataset name
    RUnit::checkException(getChIPDB("ENCODE_rE2G_1000depth"))
}

# Run all the tests
testsuite <- defineTestSuite("ChIPDBData Tests", dirs = ".", testFileRegexp = "^test_.*\\.R$")
testResults <- runTestSuite(testsuite)

# Print the results
printTextProtocol(testResults)
