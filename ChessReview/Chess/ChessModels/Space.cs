using System.Collections.Generic;

namespace Chess.ChessModels
{
    public class Space : ChessPiece
    {
        public Space()
        {
            
        }
        public override void MovePiece(ChessPiece[,] board, int[] start, int[] end) { }
        public override bool CheckSquare(ChessPiece[,] square, int[] end) { return false; }
        public override bool CheckMovement(ChessPiece[,] board, int[] start, int[] end) { return false; }
        public override List<int[]> RestrictMovement(ChessPiece[,] board, int[] start) { return new List<int[]>(); }
        public override bool IsAvailable(ChessPiece[,] board, int row, int column, int index) { return false; }
        public override void ResetMovement() { }
        /****************************/
    }
}
