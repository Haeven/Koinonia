package main

import (
  "fmt"
)

type Page struct {
  Title string
}

func (p *Page) save() string {
    return "hello"
}

func loadPage(title string) *Page {
 
    return &Page{Title: title}
}

func main() {
    p1 := &Page{Title: "TestPage"}
    p1.save()
    p2 := loadPage("TestPage")
    fmt.Println(string(p2.Title))
}

