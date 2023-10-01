# $ lintr::lint('nickkar.r')

options(digits = 12)

combination <- function(n, k, tmpn= (n - k) + 1, tmpk=1, count=1) {
    if (k == 0) {
        return(1)
    }
    if (tmpn == n) {
        return(count * (tmpn / tmpk))
    }
    else {
        combination(n, k, (tmpn + 1), (tmpk + 1), (count * (tmpn / tmpk)))
    }
}

solvecases <- function(cases, out = c(), i=1) {
    if (i > length(cases)) {
        return(out)
    }
    else {
        tmp <- unlist(strsplit(cases[i], " "))
        n <- as.double(tmp[1])
        k <- as.double(tmp[2])
        solvecases(cases, (append(out, combination(n, k))), i + 1)
    }
}

main <- function() {
    data <- readLines("stdin")
    out <- solvecases(data[2:length(data)])
    cat(out, "\n")
}

main()

# $ cat DATA.lst | rscript nickkar.r
# orynepxvieojansukaylrfxeu qrfodltahpryuvgqf titzexrgasusgrrnyb
# lhikeizyjrjqroeecwvpoxw xmoyxyiryhcbxuoaau dfeoyysnpbesyppupqihudht
# jugomvlafojmymumqeoaatzsb fnifyjjtdkheejgrpce fyrlxavleytybumoe
# lrrkuaruugallgkurcwgbnmd kuaogeybwnbpberp
