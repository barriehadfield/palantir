class TopLevelComponent < Hyperloop::Component
  render(DIV) do
    h1 { "Time to Compare" }
    FileChooser()
    CompareButton()
    ChangeTree()
    ComparisonDocument()
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

class ChangeTree < Hyperloop::Component
  render do
    div(id: 'changes-tree')
  end
end

class ComparisonDocument < Hyperloop::Component
  render do
    div(id: 'comparison-document')
  end
end
