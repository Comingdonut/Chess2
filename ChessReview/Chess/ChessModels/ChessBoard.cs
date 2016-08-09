using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chess.ChessModels
{
    public class ChessBoard
    {
        ChessSquare[,] Squares;
        public ChessBoard()
        {
            CreateSquares();
            AddPieces();
            PrintBoard();
        }
        #region SetBoard
        /// <summary>
        /// Creates a board of empty board squares.
        /// </summary>
        public void CreateSquares()
        {
            //Board
            Squares = new ChessSquare[8, 8];
            ChessColor color = ChessColor.LIGHT; 
            //Empty squares
            for (int x = 0; x < 8; ++x)
            {
                for (int y = 0; y < 8; y++)
                {
                    Squares[x, y] = new ChessSquare(x, y, color);
                    color = ChangeColor(color);
                }
                color = ChangeColor(color);
            }
        }
        /// <summary>
        /// Add pieces to the board squares.
        /// </summary>
        public void AddPieces()
        {
            //Sets Black & White Pieces
            Squares[0, 4].Piece = new King('d');//Kings
            Squares[7, 4].Piece = new King('l');//Kings
            Squares[0, 3].Piece = new Queen('d');//Queens
            Squares[7, 3].Piece = new Queen('l');//Queens
            for (int x = 2; x < 6; x += 3)
            {
                Squares[0, x].Piece = new Bishop('d');//Black Bishops
                Squares[7, x].Piece = new Bishop('l');//White Bishops
            }
            for (int x = 1; x < 7; x += 5)
            {
                Squares[0, x].Piece = new Knight('d');//Black Knight
                Squares[7, x].Piece = new Knight('l');//White Knight
            }
            for (int x = 0; x < 9; x += 7)
            {
                Squares[0, x].Piece = new Rook('d');//Black Rooks
                Squares[7, x].Piece = new Rook('l');//White Rooks
            }
            for (int x = 0; x < 8; x++)
            {
                Squares[1, x].Piece = new Pawn('d');//Black Pawns
                Squares[6, x].Piece = new Pawn('l');//White Pawns
            }
        }
        /// <summary>
        /// Changes color to it's opposite value.
        /// </summary>
        /// <param name="color">Returns the opposite value.</param>
        /// <returns></returns>
        public ChessColor ChangeColor(ChessColor color)
        {
            ChessColor newColor = color == ChessColor.LIGHT ? ChessColor.DARK : ChessColor.LIGHT;
            return newColor;
        }
        /// <summary>
        /// Prints out 8 array values before moving on to the next set of values.
        /// This will continue essentially creating a board.
        /// </summary>
        /// <param name="boardSqaures">Represents a board. Required size for the 2-D array is 8 rows and 8 columns.</param>
        public void PrintBoard()
        {
            for (int x = 0; x < 8; ++x)
            {
                for (int y = 0; y < 8; y++)
                {
                    ChessSquare square = Squares[x, y];
                    if (square.Color == ChessColor.LIGHT)
                    {
                        Console.BackgroundColor = ConsoleColor.DarkMagenta;
                    }
                    else if (square.Color == ChessColor.DARK)
                    {
                        Console.BackgroundColor = ConsoleColor.DarkGreen;
                    }
                    if (square.Piece != null)
                    {
                        Console.ForegroundColor = square.Piece.Color == 'l' ? ConsoleColor.White : ConsoleColor.Cyan;
                        Console.Write(" " + square.Piece.Symbol + " ");
                    }
                    else
                    {
                        Console.Write("   ");
                    }
                }
                Console.WriteLine();
            }
            Console.ResetColor();
        }
        #endregion
    }
}
