NR==1 {
    num = $1

    for(i=0; i<=num+2; i++) {
        board[i] = 0
    }
}
NR>1 {
    board[$1]++
    board[$2+1]--
}
END {
    for(i=1; i<=num; i++) {
        board[i] += board[i-1]

        if(board[i] % 2 == 0) {
            printf "0"
        } else {
            printf "1"
        }
    }
    print ""
}
