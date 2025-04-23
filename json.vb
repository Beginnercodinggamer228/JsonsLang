Imports System

Imports System.IO

Imports Syste m.Security.Cryptography

Imports System.Text


Module Module1

  RanCode(length As Integer) As String

  Dim chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

  Return New String(characters.Substring(CInt(Rnd() * characters.Length), length))

  End Function


Sub FileValue(name As String, exp As String, data As Dictionary(Of String, Object))

  Using file As StreamWriter = File.CreateText(String.Format("{0}.{1}", name, exp))

  file.Write(New JsonWriter().WriteObject(data))

  End Using

  End Sub


Sub Main()

  Console.Write("Введите имя - ")

  Dim username As String = Console.ReadLine()


Dim password As String = RanCode(CInt(10) + CInt(Rnd() * 10))


Dim datafile As New Dictionary(Of String, Object)

  datafile.Add("username", username)

  datafile.Add("password", password)

  datafile.Add("iflogin?", True)


FileValue("File", "json", datafile)

  End Sub

End Module


Module JsonWriter

  Public Function WriteObject(obj As Object) As String

  Throw New NotImplementedException()

  End Function

End Module


Class Rnd

  Shared Property Rnd As Random

  Private static readonly RndInstance = New Random()


Friend  Overloads Function Rnd() As Single

  Return RndInstance.NextDouble()

  End Function

End Class