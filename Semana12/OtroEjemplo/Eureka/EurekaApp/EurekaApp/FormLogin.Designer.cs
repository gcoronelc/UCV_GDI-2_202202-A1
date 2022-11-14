namespace EurekaApp
{
   partial class FormLogin
   {
      /// <summary>
      /// Required designer variable.
      /// </summary>
      private System.ComponentModel.IContainer components = null;

      /// <summary>
      /// Clean up any resources being used.
      /// </summary>
      /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
      protected override void Dispose(bool disposing)
      {
         if (disposing && (components != null))
         {
            components.Dispose();
         }
         base.Dispose(disposing);
      }

      #region Windows Form Designer generated code

      /// <summary>
      /// Required method for Designer support - do not modify
      /// the contents of this method with the code editor.
      /// </summary>
      private void InitializeComponent()
      {
         this.label1 = new System.Windows.Forms.Label();
         this.txtUsuaio = new System.Windows.Forms.TextBox();
         this.txtClave = new System.Windows.Forms.TextBox();
         this.label2 = new System.Windows.Forms.Label();
         this.btnProcesar = new System.Windows.Forms.Button();
         this.btnCerrar = new System.Windows.Forms.Button();
         this.lblMensaje = new System.Windows.Forms.Label();
         this.SuspendLayout();
         // 
         // label1
         // 
         this.label1.AutoSize = true;
         this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
         this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
         this.label1.Location = new System.Drawing.Point(70, 65);
         this.label1.Name = "label1";
         this.label1.Size = new System.Drawing.Size(102, 29);
         this.label1.TabIndex = 0;
         this.label1.Text = "Usuario:";
         // 
         // txtUsuaio
         // 
         this.txtUsuaio.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
         this.txtUsuaio.Location = new System.Drawing.Point(227, 62);
         this.txtUsuaio.Name = "txtUsuaio";
         this.txtUsuaio.Size = new System.Drawing.Size(375, 35);
         this.txtUsuaio.TabIndex = 1;
         this.txtUsuaio.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
         // 
         // txtClave
         // 
         this.txtClave.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
         this.txtClave.Location = new System.Drawing.Point(227, 103);
         this.txtClave.Name = "txtClave";
         this.txtClave.PasswordChar = '*';
         this.txtClave.Size = new System.Drawing.Size(375, 35);
         this.txtClave.TabIndex = 3;
         this.txtClave.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
         // 
         // label2
         // 
         this.label2.AutoSize = true;
         this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
         this.label2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
         this.label2.Location = new System.Drawing.Point(70, 106);
         this.label2.Name = "label2";
         this.label2.Size = new System.Drawing.Size(80, 29);
         this.label2.TabIndex = 2;
         this.label2.Text = "Clave:";
         this.label2.Click += new System.EventHandler(this.label2_Click);
         // 
         // btnProcesar
         // 
         this.btnProcesar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
         this.btnProcesar.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
         this.btnProcesar.Location = new System.Drawing.Point(70, 238);
         this.btnProcesar.Name = "btnProcesar";
         this.btnProcesar.Size = new System.Drawing.Size(268, 80);
         this.btnProcesar.TabIndex = 4;
         this.btnProcesar.Text = "Procesar";
         this.btnProcesar.UseVisualStyleBackColor = false;
         this.btnProcesar.Click += new System.EventHandler(this.button1_Click);
         // 
         // btnCerrar
         // 
         this.btnCerrar.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
         this.btnCerrar.Location = new System.Drawing.Point(344, 238);
         this.btnCerrar.Name = "btnCerrar";
         this.btnCerrar.Size = new System.Drawing.Size(258, 80);
         this.btnCerrar.TabIndex = 6;
         this.btnCerrar.Text = "Cerrar";
         this.btnCerrar.UseVisualStyleBackColor = true;
         this.btnCerrar.Click += new System.EventHandler(this.button3_Click);
         // 
         // lblMensaje
         // 
         this.lblMensaje.AutoSize = true;
         this.lblMensaje.Font = new System.Drawing.Font("Segoe UI", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
         this.lblMensaje.ForeColor = System.Drawing.Color.LightCoral;
         this.lblMensaje.Location = new System.Drawing.Point(70, 182);
         this.lblMensaje.Name = "lblMensaje";
         this.lblMensaje.Size = new System.Drawing.Size(119, 30);
         this.lblMensaje.TabIndex = 7;
         this.lblMensaje.Text = "lblMensaje";
         this.lblMensaje.Visible = false;
         // 
         // FormLogin
         // 
         this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 19F);
         this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
         this.ClientSize = new System.Drawing.Size(701, 379);
         this.Controls.Add(this.lblMensaje);
         this.Controls.Add(this.btnCerrar);
         this.Controls.Add(this.btnProcesar);
         this.Controls.Add(this.txtClave);
         this.Controls.Add(this.label2);
         this.Controls.Add(this.txtUsuaio);
         this.Controls.Add(this.label1);
         this.Name = "FormLogin";
         this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
         this.Text = "INICIO DE SESIÓN";
         this.ResumeLayout(false);
         this.PerformLayout();

      }

      #endregion

      private System.Windows.Forms.Label label1;
      private System.Windows.Forms.TextBox txtUsuaio;
      private System.Windows.Forms.TextBox txtClave;
      private System.Windows.Forms.Label label2;
      private System.Windows.Forms.Button btnProcesar;
      private System.Windows.Forms.Button btnCerrar;
      private System.Windows.Forms.Label lblMensaje;
   }
}