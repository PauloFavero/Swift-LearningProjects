//: [Anterior](@previous)
//: # Implementação

import Foundation

class ColoniaDeBacterias:Testable {
    
    
    //Adicione quaisquer métodos e propriedades que
    //você desejar para implementar o algoritmo da
    //Colônia de Bactérias
    
    //Esta função deve retornar nil, caso não seja possível
    //executar o algoritmo ou um dado do tipo Output. O inicializador
    //deste tipo recebe dois parâmetros: o tempo em que o primeiro
    //ponto de controle foi alcançado e o tempo em que todos os
    //pontos de controle foram alcançados. Por exemplo, se a colônia
    //alcancá o primeiro ponto de controle no tempo 1s e todos
    //os pontos no tempo 5s devemos criar este dado com Output(1,5).
    
    // Variables to control time iteration
    var time=1
    var firstTime = false
    var firstFlagtime = 1
    
    let controlPoint:Character="🚩"
    let field:Character="🍞"
    let bacter:Character="👾"
    let bacterNew:Character="*"
    
    //Declaration of board nxm
    var board: [[Character]] = []
    
    
    /// Verify a vector of strings to get the size of the vector and the size of the strings
    ///
    /// - Parameter matrix: matrix nx1
    /// - Returns: tuple which contains the size of rows and columns to create the board rowsxcolumns
    func orderOfMatrix(_ matrix:[String])->(x: Int, y:Int){
        let rows=matrix.count
        let columns=matrix[0].characters.count
        
        return (rows,columns)
    }
    
    
    
    
    
    /// Transforms a vector of strings to a matrix nxm of characters
    ///
    /// - Parameters:
    ///   - matrix: matrix nx1 of strings
    ///   - board: matrix nxm
    func transferMatrix(_ matrix:[String], _ board:inout[[Character]]){
        
        for i in 0..<matrix.count{
            var aux=0
            for c in matrix[0].characters{
                board[i][aux]=c
                aux+=1
            }
        }
        
    }
    
    /// Go through the matrix exchanging 'new bacters' for 'bacters' to actualize the board
    ///
    /// - Parameter board: matrix nxm
    func reset(_ board:inout[[Character]]){
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                if  board[i][j]==bacterNew {
                    board[i][j]=bacter
                }
                
            }
        }
        
    }
    
    ///Analyses the board and counts the number of control points
    
    ///
    /// - Parameter board: matrix nxm
    /// - Returns: numberr of control points
    func countControlPoint(_ board:[[Character]]) -> Int {
        var count=0
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                if  board[i][j]==controlPoint {
                    count+=1
                }
                
            }
        }
        return count
    }
    
    /// Function that analyses the board and counts the number of bacters
    ///
    /// - Parameter board: matrix nxm
    /// - Returns: number of bacters
    func countBacter(_ board:[[Character]]) -> Int {
        var count=0
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                if  board[i][j]==bacter {
                    count+=1
                }
                
            }
        }
        return count
    }
    
    
    
    /// Makes the iteration of each cell in the bord and, if it's a bacter, calls the function changeBoard
    ///
    /// - Parameter board: matrix nxm
    func proliferate(_ board:inout[[Character]]) {
        for i in 0..<board.count{
            for j in 0..<board[i].count{
                switch board[i][j] {
                case field:
                    break
                case bacter:
                    changeBoard(_board: &board, rowPosition: i, columnPosition: j)
                case controlPoint:
                    break
                case bacterNew:
                    break
                default:
                    print("")
                }
                
            }
        }
        
        reset(&board)
    }
    
    
    /// Prints the board
    ///
    /// - Parameter board: matrix nxm
    func printBoard(_ board:[[Character]]){
        for i in 0..<board.count{
            print(board[i])
        }
    }
    
    
    /// Executes for each bacter in the board its moviments to proliferate if it's possible
    ///
    /// - Parameters:
    ///   - _board: matrix nxm
    ///   - x: line position in the board
    ///   - y: column position in the board
    func changeBoard(_board:inout[[Character]],rowPosition x:Int,columnPosition y:Int){
        
        //tuples to set the moviments in the board
        let up=(r:x-1,c:y)
        let down=(r:x+1,c:y)
        let left=(r:x,c:y-1)
        let right=(r:x,c:y+1)
        
        //Verify if the moviments are possible and if it's a bacter or control point
        // If it is a bacter makes the moviment
        //If it's a control point change the boolean value for true to set the first time that a bacter takes a control point
            if x+1<board.count && (board[x+1][y] != bacter){
                if board[x+1][y] == controlPoint{
                    firstTime=true
                }
                board[down.r][down.c]=bacterNew
            }
        
            if x-1>=0 && board[x-1][y] != bacter{
                if board[x-1][y] == controlPoint{
                    firstTime=true
                }
                board[up.r][up.c]=bacterNew
            }
        
             if y+1<board[0].count && board[x][y+1] != bacter{
                if board[x][y+1] == controlPoint{
                    firstTime=true
                }
                board[right.r][right.c]=bacterNew
                
            }
        
            if y-1>=0 && board[x][y-1] != bacter{
                if board[x][y-1] == controlPoint{
                    firstTime=true
                }
                board[left.r][left.c]=bacterNew
            }
    }
    
    func execute(matrix: [String]) -> Output? {
        var output:Output? = nil;
        var aux=true
        //Size of rows and columns of the matrix of strings
        let (xMatrix, yMatrix) = orderOfMatrix(matrix)
        //Setting the size board
        board = Array(repeating: Array(repeating: "0", count: yMatrix), count: xMatrix)
        
        transferMatrix(matrix, &board)
        
        //Setting the initial control points and initial bacters in the board
        let controlPointInitial=countControlPoint(board)
        let numberBacter=countBacter(board)
        
        if controlPointInitial != 0 && numberBacter != 0 {
            while countControlPoint(board) > 0 {
                proliferate(&board)
                printBoard(board)
                time+=1
                // Verifies the condition to set the first control point contamined
                if firstTime == true && aux == true{
                    
                    firstFlagtime=time
                    firstTime=false
                    aux=false
                }
                
            }
            
            output =  Output(firstFlagtime,time)
        }
        
        return output
    }
    
}


//Este código valida a sua implementação
test(ColoniaDeBacterias())
