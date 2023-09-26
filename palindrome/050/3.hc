package palindrome

import (
    "bytes"
    "unicode"
)

// Palindrome sentence
type PSentence string

func (ps PSentence) IsPalindrome() bool {
    cs := clearSentence(ps)        //clear string
    rev := reverse(cs)
    return cs == rev
}

// removes all extra characters
func clearSentence(ps PSentence) string {
    s := string(ps)
    var buffer bytes.Buffer
    for _, r := range s {
        if unicode.IsLetter(r) {
            buffer.WriteRune(unicode.ToLower(r))
        }
    }
    return buffer.String()
}

// revers string
// word -> drow
func reverse(s string) string {
    length := len(s)
    rev := make([]byte, length)
    for i := 0; i < length; i++ {
        rev[length - 1 - i] = s[i]
    }
    return string(rev)
}
