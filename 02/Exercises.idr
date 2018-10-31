-- 2
palindrome : String -> Bool
palindrome str = reverse str == str

-- 3
palindromeLower : String -> Bool
palindromeLower str = let str' = Strings.toLower str in reverse str' == str'

-- 4
palindromeLowerLonger : String -> Bool
palindromeLowerLonger str =
  let str' = Strings.toLower str in length str > 10 && reverse str' == str'

-- 5
palindromeLowerLonger' : String -> Nat -> Bool
palindromeLowerLonger' str len =
  let str' = Strings.toLower str in length str > len && reverse str' == str'

-- 6
counts : String -> (Nat, Nat)
counts str = (length (words str), length str)

-- 7
top_ten : Ord a => List a -> List a
top_ten xs = take 10 (sort xs)

-- 8
over_length : Nat -> List String -> Nat
over_length n xs = length (filter (\ x => (length x) > n ) xs)

main : Show b => (String -> b) -> IO ()
main f = repl "\nEnter a string: " (show . f)
