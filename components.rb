class TopLevelComponent < Hyperloop::Component
  render(DIV) do
    h1 { "Hello here now" }
    FileChooser()
    CompareButton()
  end
end

class FileChooser < Hyperloop::Component
  render(DIV) do
    form(id:"choose", enctype: "multipart/form-data", role: "form") {
      P {
        p {"File number ONE"}
        input(id: "file1", type: "file", name: "file1")
      }
      P {
        p {"And the next one"}
        input(id: "file2", type: "file", name: "file2")
      }
    }
  end
end

class CompareButton < Hyperloop::Component
  render(DIV) do
    button() { "Compare" }.on(:click) do
      puts "about to compare"
      `window.startComparison('comparison-document', 'changes-tree');`
    end
  end
end
