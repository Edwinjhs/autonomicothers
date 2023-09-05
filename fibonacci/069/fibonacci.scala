import scala.io.Source

trait BaseProblem {
  private val lines: Iterator[String] = Source.fromInputStream(System.in).getLines()

  def solve(lines: Iterator[String]): String

  def main(args: Array[String]) {
    val answer: String = solve(lines)
    println(answer)
  }
}

trait TypedInput[T] {
  def convertStringToInput(s: String): T
}

trait IndividualInputs[T] extends TypedInput[T] {
  def solveParsedInputs(n: Int, inputs: List[T]): String = {
    require(n == inputs.size, s"Expected $n inputs. Actual ${inputs.size} inputs.")
    solveInputs(inputs)
  }

  val resultSeparator: String = " "

  val filterOutBlanks: Boolean = false

  def solveInputs(inputs: List[T]): String = {
    val results: List[String] = inputs.map(solveInput).map(_.toString)

    if (filterOutBlanks) results.filterNot(_ == "").mkString(resultSeparator)
    else results.mkString(resultSeparator)
  }

  def solveInput(input: T): Any
}

object ArgumentHelper {
  implicit class SeqWrapper[T](seq: Seq[T]) {
    def toPair: (T, T) = (seq(0), seq(1))
    def toTriplet: (T, T, T) = (seq(0), seq(1), seq(2))
    def toQuartet: (T, T, T, T) = (seq(0), seq(1), seq(2), seq(3))
  }

  implicit class StringWrapper(string: String) {
    def toTypedSeq[T](f: (String) => T): Seq[T] = string.split(" ").map(f)
    def toTokens: Seq[String] = toTypedSeq(s => s)
    def toPair[T](f: (String) => T): (T, T) = toTypedSeq(f).toPair
    def toTriplet[T](f: (String) => T): (T, T, T) = toTypedSeq(f).toTriplet
    def toQuartet[T](f: (String) => T): (T, T, T, T) = toTypedSeq(f).toQuartet
    def asList[T](f: (String) => T): List[T] = toTypedSeq(f).toList
    def asTokensList: List[String] = toTokens.toList
  }
}

object TupleHelper {
  implicit class PairWrapper[T](pair: (T, T)) {
    def map[U](f: (T) => U): (U, U) = (f(pair._1), f(pair._2))
  }

  implicit class TripletWrapper[T](triplet: (T, T, T)) {
    def map[U](f: (T) => U): (U, U, U) = (f(triplet._1), f(triplet._2), f(triplet._3))
  }
}

trait SplitSingleLineInputs[T] extends BaseProblem with IndividualInputs[T] {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt
    val inputs: List[T] = lines.next().split(delimiter).map(convertStringToInput).toList

    solveParsedInputs(n, inputs)
  }

  val delimiter: String = " "
}

object Solution extends SplitSingleLineInputs[Int] {
  override def convertStringToInput(s: String): Int = s.toInt

  override def solveInput(m: Int): Any = {
    indexedFibonacci.tail.dropWhile(_._1 % m != 0).head._2
  }

  lazy val zero = BigInt(0)
  lazy val one = BigInt(1)

  lazy val fibonacci: Stream[BigInt] = zero #:: one #:: nextFibonacci(zero, one)
  lazy val indexedFibonacci = fibonacci.zipWithIndex

  def nextFibonacci(a: BigInt, b: BigInt): Stream[BigInt] = {
    val c = a + b
    c #:: nextFibonacci(b, c)
  }
}
