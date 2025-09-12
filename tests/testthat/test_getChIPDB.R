test_that("test DB loading", {

    ChIPDB <- ChIPDBData::getChIPDB("ENCODE_rE2G_300depth")
    expect_equal(length(ChIPDB), 2)
    
    # first element is a vector
    expect_true(is.vector(ChIPDB[[1]]))
    
    # second element is a list
    expect_true(is.list(ChIPDB[[2]]))
    
    # edge case: wrong dataset name
    
})

test_that("test with edge case: wrong dataset name", {
    expect_error(ChIPDBData::getChIPDB("ENCODE_rE2G_1000depth"))
})
