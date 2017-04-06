class TopLevelComponent < Hyperloop::Component
  render do
    div.container {
      h1 { "Time to Compare" }
      FileChooser()
      br
      CompareButton()
      br
      div.row {
        div.col_md_4 { ChangeTree() }
        div.col_md_8 { ComparisonDocument() }
      }
    }
  end
end



class FileChooser < Hyperloop::Component
  render do
    form(id:"choose", enctype: "multipart/form-data", role: "form") {
      div.row {
        div.col_md_6 {
          input(id: "file1", type: "file", name: "file1")
        }
        div.col_md_6 {
          input(id: "file2", type: "file", name: "file2")
        }
      }
    }
  end
end

class CompareButton < Hyperloop::Component
  render(DIV) do
    button.btn.btn_primary { "Compare" }.on(:click) do
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
