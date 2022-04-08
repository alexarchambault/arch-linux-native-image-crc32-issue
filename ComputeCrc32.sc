//> using scala "2.13"
//> using lib "com.lihaoyi::os-lib:0.8.1"

import java.lang.Long.toHexString
import java.util.zip.CRC32

val (file, splitsOpt) = args match {
  case Array(arg) => (os.Path(arg, os.pwd), None)
  case Array(arg, splits) => (os.Path(arg, os.pwd), Some(splits.split(',').map(_.toInt).toSeq))
  case _ => sys.error("Usage: ComputeCrc32 path")
}

val crc = new CRC32
val content = os.read.bytes(file)
splitsOpt match {
  case None =>
    crc.update(content, 0, content.length)
  case Some(splits) =>
    System.err.println("Using splits: " + splits.mkString(","))
    var start = 0
    for (i <- splits if i <= content.length) {
      crc.update(content, start, i - start)
      start = i
    }
    if (content.length > start)
    crc.update(content, start, content.length - start)
}
println("CRC32: " + toHexString(crc.getValue))
