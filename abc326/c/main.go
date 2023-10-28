package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

func main() {
	var n, m int
	fmt.Scanf("%d %d", &n, &m)

	sc := bufio.NewScanner(os.Stdin)
	buf := make([]byte, 4096)
	sc.Buffer(buf, 1024*1024)
	sc.Scan()
	var a []int
	for _, input := range strings.Split(sc.Text(), " ") {
		v, _ := strconv.Atoi(input)
		a = append(a, v)
	}
	sort.Ints(a)

	answer := 0

	for i := 0; i < n; i++ {
		start := float64(a[i]) - 0.5
		count := 0
		for j := i; j < n; j++ {
			if float64(a[j])-start < float64(m) {
				count += 1
			}
		}

		if count > answer {
			answer = count
		}
	}

	fmt.Println(answer)
}
