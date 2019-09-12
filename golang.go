
// Read the body of an http response to a string
  responseBody, _ := ioutil.ReadAll(res.Body)
  content := string(responseBody)
  fmt.Println(content)

// String contains something? (substring)

	strings.Contains(content, "ohai")
