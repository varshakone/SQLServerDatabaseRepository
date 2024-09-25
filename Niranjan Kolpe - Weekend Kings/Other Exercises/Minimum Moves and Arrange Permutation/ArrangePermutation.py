def checkPermutation(T, test_cases):
    results = list()
    for test in test_cases:
        N, P, Q = test
        max_positions = N - 2
        if P + Q <= max_positions:
            results.append("Yes")
        else:
            results.append("No")
    return results

ip = int(input())
t_cases = list()
for _ in range(ip):
    n, p, q = map(int, input().split())
    t_cases.append((n, p, q))
output = checkPermutation(ip, t_cases)
for op in output:
    print(op)