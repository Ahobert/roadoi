context("testing oadoi_fetch")

test_that("oadoi_fetch returns", {
  skip_on_cran()
  a <- oadoi_fetch(dois = "10.7717/peerj.2323")
  b <- oadoi_fetch(dois = c("10.1038/ng.919", "10.1105/tpc.111.088682"),
                   email = "test@test.com")
  c <- oadoi_fetch("10.1016/j.shpsc.2013.03.020")


  # correct classes
  expect_is(a, "tbl_df")
  expect_is(b, "tbl_df")
  expect_is(c, "tbl_df")

  # correct dimensions
  expect_equal(nrow(a), 1)
  expect_equal(nrow(b), 2)
  expect_equal(nrow(c), 1)

  expect_warning(oadoi_fetch(dois = c("ldld", "10.1038/ng.3260")))
})
