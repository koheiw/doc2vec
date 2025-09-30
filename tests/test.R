library(quanteda)
library(doc2vec)
library(wordvector)

dat <- data.frame(doc_id = docnames(data_corpus_news2014),
                  text = data_corpus_news2014)

dm <- paragraph2vec(head(dat, 100000), min_count = 1, dim = 10, threads = 1, type = "PV-DM", trace = 2,
                    lr = 0.05)

hist(as.matrix(dm, which = "docs", normalize = FALSE))

dbow <- paragraph2vec(head(dat, 2), min_count = 1, dim = 10, threads = 1, type = "PV-DBOW", trace = TRUE)
as.matrix(dm, which = "docs", normalize = FALSE)
as.matrix(dbow, which = "docs", normalize = FALSE)

