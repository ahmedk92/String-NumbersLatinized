extension String {
    /**
        Returns the same string ensuring digits are in Latin.
        Useful in https requests, when the backend doesn't handle non-Latin digits.
        Not for cross-locale real value conversions (e.g. 12,5 => 12.5).
     */
    var withNumbersLatinized: String {
        get {
            var selfASNSString = self as NSString
            let pattern = "\\d+"
            if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
                let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, selfASNSString.length))
                for match in matches {
                    selfASNSString = selfASNSString.replacingCharacters(in: match.range, with: "\((selfASNSString.substring(with: match.range) as NSString).integerValue)") as NSString
                }
                
                return selfASNSString as String
            } else {
                return self
            }
        }
    }
}