using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chess.ChessModels
{
    public class ChessBoard
    {
        public ChessSquare[,] Squares { get; set; }
        public ChessBoard()
        {
            CreateSquares();
            AddPieces();
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
            Squares[0, 4].Piece = new King(ChessColor.DARK);//Kings
            Squares[7, 4].Piece = new King(ChessColor.LIGHT);//Kings
            Squares[0, 3].Piece = new Queen(ChessColor.DARK);//Queens
            Squares[7, 3].Piece = new Queen(ChessColor.LIGHT);//Queens
            for (int x = 2; x < 6; x += 3)
            {
                Squares[0, x].Piece = new Bishop(ChessColor.DARK);//Black Bishops
                Squares[7, x].Piece = new Bishop(ChessColor.LIGHT);//White Bishops
            }
            for (int x = 1; x < 7; x += 5)
            {
                Squares[0, x].Piece = new Knight(ChessColor.DARK);//Black Knight
                Squares[7, x].Piece = new Knight(ChessColor.LIGHT);//White Knight
            }
            for (int x = 0; x < 9; x += 7)
            {
                Squares[0, x].Piece = new Rook(ChessColor.DARK);//Black Rooks
                Squares[7, x].Piece = new Rook(ChessColor.LIGHT);//White Rooks
            }
            for (int x = 0; x < 8; x++)
            {
                Squares[1, x].Piece = new Pawn(ChessColor.DARK);//Black Pawns
                Squares[6, x].Piece = new Pawn(ChessColor.LIGHT);//White Pawns
            }
            //Empty squares
            for (int x = 0; x < 8; ++x)
            {
                for (int y = 0; y < 8; y++)
                {
                    if (Squares[x, y].Piece == null)
                    {
                        Squares[x, y].Piece = new Space();
                    }
                }
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
                        Console.ForegroundColor = square.Piece.Color == ChessColor.LIGHT ? ConsoleColor.White : ConsoleColor.Cyan;
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
