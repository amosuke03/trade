if Category.count == 0
    Category.create([
        {name: '買う'},
        {name: '売る'},
        {name: '様子見'}
        ])
    end