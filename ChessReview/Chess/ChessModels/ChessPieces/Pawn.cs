using System;
using System.Collections.Generic;

namespace Chess.ChessModels
{
    public class Pawn : ChessPiece
    {
        public Pawn()
        {
            Init();
        }

        public Pawn(ChessColor color)
        {
            Color = color;
            Init();
        }

        private void Init()
        {
            Piece = "Pawn";
            Symbol = 'P';
            ResetMovement();
        }
        public override void MovePiece(ChessSquare[,] board, int[] start, int[] end)
        {
            board[end[0], end[1]].Piece = board[start[0], start[1]].Piece;
            board[start[0], start[1]].Piece = new Space();
        }
        public override bool CheckSquare(ChessSquare[,] board, int[] end)
        {
            return false;
        }
        public override bool CheckMovement(ChessSquare[,] board, int[] start, int[] end)
        {
            ResetMovement();
            return false;
        }
        public override List<int[]> RestrictMovement(ChessSquare[,] board, int[] start)
        {
            List<int[]> available = new List<int[]>();

            return available;
        }
        public override bool IsAvailable(ChessSquare[,] board, int row, int column, int index)
        {
            bool canMove = true;
            if (board[row, column].Piece.Color == Color || board[row, column].Piece.Color != ChessColor.NONE)
            {
                canMove = false;
            }
            if (this.canMove[index] == true)
            {
                this.canMove[index] = canMove;
            }
            return canMove;
        }
        public override void ResetMovement()
        {
            canMove = new bool[] { true, true, true, true, true, true, true, true };
        }
        /****************************/
    }
}
