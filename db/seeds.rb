User.create({
        user_name: 'test1',
        password: '111',
        major: 'science'
    })
    
User.create({
        user_name: 'test2',
        password: '222',
        major: 'science'
    })
    
    
User.create({
        user_name: 'test3',
        password: '333',
        major: 'science'
    })
    
UserLecture.create([
        {date: '月'},
        {date: '火'},
        {date: '水'},
        {date: '木'},
        {date: '金'},
        {date: '土'}
        ])
        
UserLecture.create([
        {number: '1'},
        {number: '2'},
        {number: '3'},
        {number: '4'},
        {number: '5'},
        {number: '6'}
        ])